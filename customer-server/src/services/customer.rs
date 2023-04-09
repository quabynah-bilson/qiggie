use mongodb::bson::{doc, Document};
use mongodb::bson::oid::ObjectId;
use mongodb::Collection;
use mongodb::options::{FindOneOptions, InsertOneOptions, ReplaceOptions};
use tokio_stream::wrappers::ReceiverStream;
use tonic::{Request, Response, Status};
use prost_types::Timestamp;
use chrono::{DateTime, Utc};


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
            let now: DateTime<Utc> = Utc::now();
            let timestamp: Timestamp = Timestamp {
                seconds: now.timestamp(),
                nanos: now.timestamp_subsec_nanos() as i32,
            };
            let customer = Customer {
                id: document.get_str("id").unwrap().to_string(),
                display_name: document.get_str("display_name").unwrap().to_string(),
                username: document.get_str("username").unwrap().to_string(),
                phone: Some(document.get_str("phone").unwrap().to_string()),
                avatar: None,
                created_at: Some(timestamp),
                updated_at: None,
            };

            return Ok(Response::new(customer));
        }

        Err(Status::not_found("User not found"))
    }

    async fn get_customer_by_username(&self, request: Request<String>) -> Result<Response<Customer>, Status> {
        // get id from request
        let username = request.into_inner().clone();

        // filter for document
        let filter = doc! {"username" : username};
        let options = FindOneOptions::builder().build();

        // find all documents with matching id
        if let Some(doc_data) = self.collection.find_one(filter, options).await.unwrap() {
            println!("{:?}", doc_data);
            // create customer from document
            let customer = Customer {
                id: doc_data.get_str("id").unwrap().to_string(),
                display_name: doc_data.get_str("display_name").unwrap().to_string(),
                username: doc_data.get_str("username").unwrap().to_string(),
                phone: Some(doc_data.get_str("phone").unwrap().to_string()),
                avatar: Some(doc_data.get_str("avatar").unwrap().to_string()),
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
        let response = ;
        Response::new(response);
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
    let now: DateTime<Utc> = Utc::now();
    // let timestamp: Timestamp = Timestamp {
    //     seconds: now.timestamp(),
    //     nanos: now.timestamp_subsec_nanos() as i32,
    // };
    let new_customer_doc = doc! {
        "_id": ObjectId::new(),
        "phone" : updatable_customer.phone,
        "username" : updatable_customer.username,
        "display_name" : updatable_customer.display_name,
        "avatar" : "https://images.unsplash.com/photo-1619169412695-de792ce344e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80".to_string(),
        // "created_at" : None,
        // "updated_at" : None,
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
