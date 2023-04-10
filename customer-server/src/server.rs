use std::pin::Pin;

use futures::Stream;
use mongodb::Collection;
use tonic::{async_trait, Request, Response, Status};
use tonic::codegen::futures_core;

use crate::proto::Customer;
use crate::proto::customer_service_server::CustomerService;

#[derive(Debug)]
pub struct CustomerServiceImpl {
    collection: Collection<Customer>,
}

impl CustomerServiceImpl {
    pub fn new(customer_collection: Collection<Customer>) -> Self {
        Self { collection: customer_collection }
    }
}

#[async_trait]
impl CustomerService for CustomerServiceImpl {
    async fn create_customer(&self, _: Request<Customer>) -> Result<Response<String>, Status> {
        todo!()
    }

    async fn get_customer(&self, _: Request<String>) -> Result<Response<Customer>, Status> {
        todo!()
    }

    async fn get_customer_by_username(&self, _: Request<String>) -> Result<Response<Customer>, Status> {
        todo!()
    }

    async fn update_customer(&self, _: Request<Customer>) -> Result<Response<()>, Status> {
        todo!()
    }

    async fn delete_customer(&self, _: Request<String>) -> Result<Response<()>, Status> {
        todo!()
    }

    type GetCurrentCustomerStream = Pin<Box<dyn Stream<Item=Result<Customer, Status>> + Send>>;

    async fn get_current_customer(&self, _: Request<()>) -> Result<Response<Self::GetCurrentCustomerStream>, Status> {
        todo!()
    }
}