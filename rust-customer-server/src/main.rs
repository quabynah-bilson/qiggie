extern crate chrono;
extern crate dotenv;
extern crate postgres;

use console::Style;
use tonic::transport::Server;

use crate::customer::customer_service_server::CustomerServiceServer;
use crate::services::customer::CustomerServiceImpl;

pub(crate) mod db_connection;
pub(crate) mod services;

pub mod customer {
    tonic::include_proto!("customer");
}

// reference -> https://github.com/hyperium/tonic/blob/master/examples/routeguide-tutorial.md
#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    // setup connection address
    let addr = "[::1]:50051".parse().unwrap();
    let blue = Style::new().blue();
    println!(
        "connecting to rust customer grpc server using {}",
        blue.apply_to(addr)
    );

    // register services
    let customer_service = CustomerServiceImpl::default();
    let customer_svc = CustomerServiceServer::new(customer_service);

    // reflection service
    let server_reflection = tonic_reflection::server::Builder::configure()
        .build()
        .unwrap();

    // start grpc server
    Server::builder()
        .add_service(customer_svc)
        .add_service(server_reflection)
        .serve(addr)
        .await?;

    Ok(())
}
