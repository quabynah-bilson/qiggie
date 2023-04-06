use crate::customer::customer_service_server::CustomerService;

#[derive(Debug, Default)]
pub struct CustomerServiceImpl {}

#[tonic::async_trait]
impl CustomerService for CustomerServiceImpl {}
