extern crate chrono;
extern crate dotenv;
extern crate postgres;

use std::os::unix::net::SocketAddr;

use console::Style;
use tonic::transport::Server;

use account::account_piggy_bank_service_server::AccountPiggyBankServiceServer;
use transaction::transaction_piggy_bank_service_server::TransactionPiggyBankServiceServer;
use user::user_piggy_bank_service_server::UserPiggyBankServiceServer;

use crate::services::account::AccountService;
use crate::services::transaction::TransactionService;
use crate::services::user::UserService;

pub(crate) mod services;
pub(crate) mod db_connection;

pub mod user {
    tonic::include_proto!("user");
}

pub mod account {
    tonic::include_proto!("account");
}

pub mod transaction {
    tonic::include_proto!("transaction");
}

// reference -> https://github.com/hyperium/tonic/blob/master/examples/routeguide-tutorial.md
#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    // setup connection address
    let addr = "[::1]:19990".parse().unwrap();
    let blue = Style::new().blue();
    println!("connecting to rust grpc server using {}", blue.apply_to(addr));

    // register services
    let user_service = UserService::default();
    let user_svc = UserPiggyBankServiceServer::new(user_service);
    let account_service = AccountService::default();
    let account_svc = AccountPiggyBankServiceServer::new(account_service);
    let transaction_service = TransactionService::default();
    let transaction_svc = TransactionPiggyBankServiceServer::new(transaction_service);

    // start grpc server
    Server::builder()
        .add_service(user_svc)
        .add_service(account_svc)
        .add_service(transaction_svc)
        .serve(addr).await?;

    Ok(())
}
