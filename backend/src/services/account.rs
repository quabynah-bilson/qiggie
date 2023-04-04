use tokio_stream::wrappers::ReceiverStream;
use tonic::{Request, Response, Status};

use crate::account::{DeleteResponse, GetAllAccountRequest, GetAllAccountResponse, PiggyBankAccount, SingleAccountResponse};
use crate::account::account_piggy_bank_service_server::AccountPiggyBankService;

#[derive(Debug, Default)]
pub struct AccountService;

#[tonic::async_trait]
impl AccountPiggyBankService for AccountService {
    type getAllAccountStream = ReceiverStream<Result<GetAllAccountResponse, Status>>;

    async fn get_all_account(&self, request: Request<GetAllAccountRequest>) -> Result<Response<Self::getAllAccountStream>, Status> {
        todo!()
    }

    async fn create_user(&self, request: Request<PiggyBankAccount>) -> Result<Response<SingleAccountResponse>, Status> {
        todo!()
    }

    async fn update_user(&self, request: Request<PiggyBankAccount>) -> Result<Response<SingleAccountResponse>, Status> {
        todo!()
    }

    async fn delete_user(&self, request: Request<String>) -> Result<Response<DeleteResponse>, Status> {
        todo!()
    }

    async fn get_user(&self, request: Request<String>) -> Result<Response<SingleAccountResponse>, Status> {
        todo!()
    }
}