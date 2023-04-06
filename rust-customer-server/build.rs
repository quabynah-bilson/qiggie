fn main() -> Result<(), Box<dyn std::error::Error>> {
    tonic_build::compile_protos("protos/customer.proto")?;
    tonic_build::compile_protos("protos/bank.proto")?;
    tonic_build::compile_protos("protos/savings.proto")?;
    Ok(())
}
