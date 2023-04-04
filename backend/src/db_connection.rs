use std::env;

use dotenv::dotenv;
use postgres::{Client, Error, NoTls};

// establish a connection with the postgres database
pub fn establish_connection() -> Result<Client, Error> {
    dotenv().ok();
    let database_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let client = Client::connect(&*database_url, NoTls)?;
    Ok(client)
}