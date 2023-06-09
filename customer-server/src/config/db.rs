use mongodb::{Client, Collection, IndexModel};
use mongodb::bson::{doc, Document};
use mongodb::options::{ClientOptions, IndexOptions};

// initialize database configuration
pub async fn create_database() -> Result<Collection<Document>, Box<dyn std::error::Error>> {
    // get database client
    let database_uri = std::env::var("DATABASE_URI").unwrap_or_else(|_| "mongodb://localhost:27017".into());
    let client_options = ClientOptions::parse(database_uri)
        .await?;
    let client = Client::with_options(client_options)?;

    let database_name = std::env::var("DATABASE_NAME").unwrap_or_else(|_| "piggybank_test".into());
    let collection_name = std::env::var("CUSTOMER_COLLECTION").unwrap_or_else(|_| "customers".into());
    let collection = client.database(&*database_name).collection(&*collection_name);
    // index collection
    create_username_index(&collection).await;
    Ok(collection)
}

// Creates an index on the "username" field to force the values to be unique.
async fn create_username_index(collection: &Collection<Document>) {
    let options = IndexOptions::builder().unique(true).build();
    let model = IndexModel::builder()
        .keys(doc! { "phone": 1, "username" : 2 })
        .options(options)
        .build();
    collection
        .create_index(model, None)
        .await
        .expect("creating an index should succeed");
}