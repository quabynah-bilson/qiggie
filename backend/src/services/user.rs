use std::pin::Pin;

use tonic::{Request, Response, Status};
use tokio_stream::wrappers::ReceiverStream;

use crate::user::{DeleteResponse, GetAllUsersRequest, GetAllUsersResponse, PiggyBankUser, SingleUserResponse};
use crate::user::user_piggy_bank_service_server::UserPiggyBankService;

#[derive(Debug, Default)]
pub struct UserService;

#[tonic::async_trait]
impl UserPiggyBankService for UserService {
    type getAllUsersStream = ReceiverStream<Result<GetAllUsersResponse, Status>>;

    async fn get_all_users(&self, request: Request<GetAllUsersRequest>) -> Result<Response<Self::getAllUsersStream>, Status> {
        todo!()
    }

    async fn create_user(&self, request: Request<PiggyBankUser>) -> Result<Response<SingleUserResponse>, Status> {
        todo!()
    }

    async fn update_user(&self, request: Request<PiggyBankUser>) -> Result<Response<SingleUserResponse>, Status> {
        todo!()
    }

    async fn delete_user(&self, request: Request<String>) -> Result<Response<DeleteResponse>, Status> {
        todo!()
    }

    async fn get_user(&self, request: Request<String>) -> Result<Response<SingleUserResponse>, Status> {
        todo!()
    }
}