extern crate chrono;
extern crate dotenv;
extern crate postgres;

use console::Style;
use tonic::transport::Server;

pub(crate) mod db_connection;
pub(crate) mod services;

pub mod customer {
    tonic::include_proto!("customer");
}

pub mod bank {
    tonic::include_proto!("bank");
}

pub mod savings {
    tonic::include_proto!("savings");
}

// reference -> https://github.com/hyperium/tonic/blob/master/examples/routeguide-tutorial.md
#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    // setup connection address
    let addr = "[::1]:50051".parse().unwrap();
    let blue = Style::new().blue();
    println!(
        "connecting to rust grpc server using {}",
        blue.apply_to(addr)
    );

    // register services
    // let user_service = UserService::default();
    // let user_svc = UserPiggyBankServiceServer::new(user_service);
    // let account_service = AccountService::default();
    // let account_svc = AccountPiggyBankServiceServer::new(account_service);
    // let transaction_service = TransactionService::default();
    // let transaction_svc = TransactionPiggyBankServiceServer::new(transaction_service);

    // reflection service
    let server_reflection = tonic_reflection::server::Builder::configure()
        .build()
        .unwrap();

    // start grpc server
    Server::builder()
        // .add_service(user_svc)
        // .add_service(account_svc)
        // .add_service(transaction_svc)
        .add_service(server_reflection)
        .serve(addr)
        .await?;

    Ok(())
}
