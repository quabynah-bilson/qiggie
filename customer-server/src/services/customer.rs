use mongodb::bson::{doc, Document};
use mongodb::bson::oid::ObjectId;
use mongodb::Collection;
use mongodb::options::{FindOneOptions, InsertOneOptions, ReplaceOptions};
use tokio_stream::wrappers::ReceiverStream;
use tonic::{Request, Response, Status};

use crate::customer::Customer;
use crate::customer::customer_service_server::CustomerService;

#[derive(Debug, Clone)]
pub struct CustomerServiceImpl {
    collection: Collection<Document>,
}

impl CustomerServiceImpl {
    pub fn new(collection: &Collection<Document>) -> Self {
        CustomerServiceImpl {
            collection: collection.clone(),
        }
    }
}

#[tonic::async_trait]
impl CustomerService for CustomerServiceImpl {
    async fn create_customer(
        &self,
        request: Request<Customer>,
    ) -> Result<Response<String>, Status> {
        // let mut user = request.into_inner().clone();
        // if let Some(document) = self.collection.find_one(doc! {"username" : user.username}, None).await.unwrap() {
        //     println!("found account -> {}", document);
        //     return Err(Status::already_exists("User already exists"));
        // }

        // save user data
        let result = insert_customer_data(&self.collection, &mut request.into_inner()).await;

        // Replace the inserted document with its Object ID
        let filter = doc! {
            "_id": result.1.clone()
        };
        let options = ReplaceOptions::builder().upsert(false).build();
        let updated_doc = doc! {
            "_id": result.1,
            "id" : result.1.to_string(),
        };

        let mut combined_doc = Document::new();
        combined_doc.extend(result.0);
        combined_doc.extend(updated_doc);
        println!("{:?}", combined_doc);

        let result = self
            .collection
            .replace_one(filter, combined_doc.clone(), options)
            .await
            .unwrap();
        println!("{} document(s) replaced", result.modified_count);

        Ok(Response::new("Customer account added successfully".to_string()))
    }

    async fn get_customer(&self, request: Request<String>) -> Result<Response<Customer>, Status> {
        // get id from request
        let id = request.into_inner().clone();

        // filter for document
        let filter = doc! {"id" : id};
        let options = FindOneOptions::builder().build();

        // find all documents with matching id
        if let Some(document) = self.collection.find_one(filter, options).await.unwrap() {
            println!("{:?}", document);
            // create customer from document
            let customer = Customer {
                id: document.get_str("id").unwrap().to_string(),
                first_name: document.get_str("first_name").unwrap().to_string(),
                last_name: document.get_str("last_name").unwrap().to_string(),
                username: document.get_str("username").unwrap().to_string(),
                phone: document.get_str("phone").unwrap().to_string(),
                address: document.get_str("address").unwrap().to_string(),
                created_at: None,
                updated_at: None,
            };

            return Ok(Response::new(customer));
        }

        Err(Status::not_found("User not found"))
    }

    async fn update_customer(&self, _: Request<Customer>) -> Result<Response<()>, Status> {
        todo!()
    }

    async fn delete_customer(&self, _: Request<String>) -> Result<Response<()>, Status> {
        todo!()
    }

    type get_current_customerStream = ReceiverStream<Result<Customer, Status>>;

    async fn get_current_customer(
        &self,
        _: Request<()>,
    ) -> Result<Response<Self::get_current_customerStream>, Status> {
        Err(Status::invalid_argument(
            "The user with this ID does not exist",
        ))
    }
}

// helper function for inserting a new customer data into database
async fn insert_customer_data(
    collection: &Collection<Document>,
    customer_to_be_inserted: &Customer,
) -> (Document, ObjectId) {
    let updatable_customer = customer_to_be_inserted.clone();
    let new_customer_doc = doc! {
        "_id": ObjectId::new(),
        "phone" : updatable_customer.phone,
        "username" : updatable_customer.username,
        "first_name" : updatable_customer.first_name,
        "last_name" : updatable_customer.last_name,
        "address" : updatable_customer.address,
    };
    let options = InsertOneOptions::builder().build();
    let result = collection
        .insert_one(&new_customer_doc.clone(), options)
        .await
        .unwrap();
    println!("{:?}", result);

    // Get the inserted Object ID
    let id = result.inserted_id.as_object_id().unwrap();
    println!("Inserted document with ID: {}", id);
    (new_customer_doc, id)
}
