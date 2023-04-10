use env_logger;

use server::CustomerServiceImpl;

use crate::proto::customer_service_server::{CustomerServiceServer};

mod server;

mod proto {
    tonic::include_proto!("customer");

    pub(crate) const FILE_DESCRIPTOR_SET: &[u8] =
        tonic::include_file_descriptor_set!("customer_descriptor");
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    // enable logging
    env_logger::init();

    // initialize dotenv
    dotenv::dotenv().ok();

    // initialize mongo database
    let mongo_url = std::env::var("DATABASE_URI").expect("MONGO_URL must be set");
    let mongo_db = std::env::var("DATABASE_NAME").expect("MONGO_DB must be set");
    let customer_collection_name = std::env::var("CUSTOMER_COLLECTION").expect("MONGO_DB must be set");
    let mongo_client = mongodb::Client::with_uri_str(&mongo_url).await?;
    let mongo_db = mongo_client.database(&mongo_db);

    // create customer collection based on Customer proto
    let customer_collection = mongo_db.collection::<proto::Customer>(&customer_collection_name);

    // create customer service
    let customer_service = CustomerServiceImpl::new(customer_collection.clone());

    // reflection service
    let service = tonic_reflection::server::Builder::configure()
        .register_encoded_file_descriptor_set(proto::FILE_DESCRIPTOR_SET)
        .build()
        .unwrap();

    // bind to address
    let addr = "[::1]:1149".parse().unwrap();

    // build grpc server
    println!("starting rust customer server on {}", addr);
    tonic::transport::Server::builder()
        .add_service(service)
        .add_service(CustomerServiceServer::new(customer_service))
        .serve(addr)
        .await?;

    Ok(())
}
