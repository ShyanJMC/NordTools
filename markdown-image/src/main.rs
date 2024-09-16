use std::env;
use std::fs::File;
use std::io::Read;
use std::process::Command;
use base64::{engine::general_purpose::STANDARD, Engine as _};

fn main() {
    // Obtén los argumentos de la línea de comandos
    let args: Vec<String> = env::args().collect();

    // El primer argumento es siempre el binario en si mismo
    if args.len() < 2 {
    	eprintln!("This program takes files and returns the type;\n ![](data:image/[type];base64,[BASE64]) to use mdbook, pandoc, or other");
        eprintln!("Usage: {} <file1> [file2] [...]", args[0]);
        std::process::exit(1);
    }

    // Itera sobre los archivos proporcionados
    for file_path in &args[1..] {
        // Obtén el tipo MIME del archivo
        let output = Command::new("file").arg("-ib").arg(file_path).output()
            .expect("Failed to execute 'file' command");

        let buffer = String::from_utf8_lossy(&output.stdout).to_owned();
        let mime_type = buffer.trim().split(';').next()
            .unwrap_or("unknown");

        // Lee el archivo y codifícalo en base64
        let mut file = File::open(file_path).expect("Failed to open file");
        let mut buffer = Vec::new();
        file.read_to_end(&mut buffer).expect("Failed to read file");
        let encoded = STANDARD.encode(&buffer);

        // Imprime el resultado
        println!("![](data:{};base64,{})", mime_type, encoded);
    }
}
