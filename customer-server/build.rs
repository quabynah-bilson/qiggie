use std::env;
use std::path::PathBuf;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let original_out_dir = PathBuf::from(env::var("OUT_DIR")?);

    // generate proto files for server only using tonic-build
    tonic_build::configure()
        .build_server(true)
        .build_client(false)
        .file_descriptor_set_path(original_out_dir.join("customer_descriptor.bin"))
        // .compile(
        //     &["proto/googleapis/google/api/annotations.proto", "proto/googleapis/google/api/annotations.proto"],
        //     &["proto/googleapis"], // specify the root location to search proto dependencies
        // )
        .compile(&["proto/customer.proto"], &["proto"])?;
    Ok(())
}