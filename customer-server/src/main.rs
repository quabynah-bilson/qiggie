extern crate dotenv;

use console::Style;
use dotenv::dotenv;
use tonic::transport::Server;

use crate::customer::customer_service_server::CustomerServiceServer;
use crate::services::customer::CustomerServiceImpl;

pub mod config;
pub(crate) mod services;

pub mod customer {
    tonic::include_proto!("customer");
}

pub const CUSTOMER_DESCRIPTOR_SET: &[u8] = tonic::include_file_descriptor_set!("customer_descriptor");

// reference -> https://github.com/hyperium/tonic/blob/master/examples/routeguide-tutorial.md
#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    // This line loads the environment variables from the ".env" file.
    dotenv().ok();

    // setup connection address
    let addr = "0.0.0.0:1149".parse().unwrap();
    let blue = Style::new().blue();
    println!(
        "connecting to rust customer grpc server using {}",
        blue.apply_to(addr)
    );

    // initialize database configuration
    let collection = config::db::create_database().await?;

    // register services
    let customer_service = CustomerServiceImpl::new(&collection);
    let customer_svc = CustomerServiceServer::new(customer_service);

    // reflection service
    let server_reflection = tonic_reflection::server::Builder::configure()
        .register_encoded_file_descriptor_set(CUSTOMER_DESCRIPTOR_SET)
        .build()?;

    // start grpc server
    Server::builder()
        .add_service(customer_svc)
        .add_service(server_reflection)
        .serve(addr)
        .await?;

    Ok(())
}
