use std::fs;
use std::io;

fn main() -> io::Result<()> {
    let path = "/mnt/c/Users/kiril/Desktop/strace/README.md";
    let content = fs::read_to_string(path)?;
    println!("{}", content);
    Ok(())
}