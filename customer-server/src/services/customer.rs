use tokio_stream::wrappers::ReceiverStream;
use tonic::{Request, Response, Status};
use crate::customer::Customer;
use crate::customer::customer_service_server::CustomerService;

#[derive(Debug, Default)]
pub struct CustomerServiceImpl {}

#[tonic::async_trait]
impl CustomerService for CustomerServiceImpl {
    async fn create_customer(&self, _: Request<Customer>) -> Result<Response<String>, Status> {
        todo!()
    }

    async fn get_customer(&self, _: Request<String>) -> Result<Response<Customer>, Status> {
        todo!()
    }

    async fn update_customer(&self, _: Request<Customer>) -> Result<Response<()>, Status> {
        todo!()
    }

    async fn delete_customer(&self, _: Request<String>) -> Result<Response<()>, Status> {
        todo!()
    }

    type GetCurrentCustomerStream = ReceiverStream<Result<Customer, Status>>;

    async fn get_current_customer(&self, _: Request<()>) -> Result<Response<Self::GetCurrentCustomerStream>, Status> {
        todo!()
    }
}
