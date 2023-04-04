fn main() -> Result<(), Box<dyn std::error::Error>> {
    tonic_build::compile_protos("protos/user.proto")?;
    tonic_build::compile_protos("protos/account.proto")?;
    tonic_build::compile_protos("protos/transaction.proto")?;
    Ok(())
}