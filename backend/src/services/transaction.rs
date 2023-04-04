use tonic::{Request, Response, Status};

use crate::transaction::{DepositRequest, TransactionResponse, WithdrawRequest};
use crate::transaction::transaction_piggy_bank_service_server::TransactionPiggyBankService;

#[derive(Debug, Default)]
pub struct TransactionService;

#[tonic::async_trait]
impl TransactionPiggyBankService for TransactionService {
    async fn deposit(&self, request: Request<DepositRequest>) -> Result<Response<TransactionResponse>, Status> {
        todo!()
    }

    async fn withdraw(&self, request: Request<WithdrawRequest>) -> Result<Response<TransactionResponse>, Status> {
        todo!()
    }

    async fn get_transaction_details(&self, request: Request<String>) -> Result<Response<TransactionResponse>, Status> {
        todo!()
    }
}