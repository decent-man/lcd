
use std::{ env,
           fs,
           os::unix::prelude::MetadataExt,
           path::PathBuf,
};
use ansi_term::Colour;
use term_size;

const COLUMNS_FACTOR: usize = 5;
const PADDING_FACTOR: usize = 3;

#[macro_export]
macro_rules! file_name {
    ($file: expr) => { $file.file_name().unwrap().to_str().unwrap() }
}
macro_rules! wrap {
    ($count: expr) => { 
    println!("{:▭<1$}","",$count);
    }
}

struct DirData {
    dirs: Vec<(PathBuf,usize)>,
    files: Vec<(PathBuf,usize)>,
    maxlen: usize
}

impl DirData {
    fn from(dir: PathBuf) -> DirData {
        let files : Vec<PathBuf> = fs::read_dir(dir)
                                            .unwrap()
                                            .filter_map(|file| Some(file.unwrap().path()))
                                            .collect();
        let mut dirs_v : Vec<(PathBuf,usize)> = Vec::new();
        let mut files_v : Vec<(PathBuf,usize)> = Vec::new();
        let mut max_chars: usize = 0;
        for file in files {
            let fname_len = file.file_name().unwrap()
                               .to_str().unwrap()
                               .chars()
                               .count();
            if fname_len > max_chars { max_chars = fname_len }
            if file.is_dir() { dirs_v.push((file,fname_len));}
            else{files_v.push((file,fname_len));}
        }
        dirs_v.sort();
        files_v.sort();
        DirData { dirs: dirs_v,
                  files: files_v,
                  maxlen: max_chars }
    }
    fn pretty_print(&self,columns: &usize) {
        let mut dir_listed: Vec<(String,usize)> = Vec::new();
        // Directories
        self.dirs.iter().for_each(|dir|  {
        dir_listed.push((format!("{}/", Colour::Black.on(Colour::White)
                                                     .paint(format!(" {} ",file_name!(dir.0))) ),
                         dir.1+3)
        );
        });
        // Files
        self.files.iter().for_each(|file| {
            if file.0.symlink_metadata().unwrap().file_type().is_symlink() {
                dir_listed.push((format!("{}@", Colour::Cyan.bold()
                                             .italic()
                                             .underline()
                                             .paint(format!("{}",file_name!(file.0))) ),
                                file.1+1));
            }
            else if { file.0.metadata().unwrap().mode() & 0o111 } != 0 {
                dir_listed.push((format!("{}✱", Colour::Green.bold()
                                              .paint(format!("{}",file_name!(file.0))) ),
                        file.1+1));
            }
            else {
                dir_listed.push((format!("{}", Colour::Fixed(15).bold()
                                                               .paint(file_name!(file.0)),
                                        ),
                        file.1));
            }
        });
        DirData::formatter(dir_listed,columns,&self.maxlen);
    }
    fn formatter(files: Vec<(String,usize)>, columns: &usize,char_max: &usize) {
        let max_columns = columns / (char_max + COLUMNS_FACTOR);
        let max_rows = (files.len() / max_columns) + 1;
        //println!("Xrows = {},\t Xcols = {},\t Xchar = {},\t Nfiles = {}",max_rows,max_columns,char_max,files.len());
        for i in 0..max_rows {
            for j in 0..max_columns {
                let index = i+(max_rows*(j));
                 if index >= files.len() { break; }
                let padding = vec![" "; (char_max+PADDING_FACTOR) - files[index].1 ].join("");
                print!("┆{}{}",files[index].0, if j < max_columns {padding} else { "-".to_string() });
            }
            print!("\n");
        }
    }
}

fn main() {
    let columns =  match term_size::dimensions() { Some((cols,_)) => cols, None => 0};
    println!("{esc}[2J{esc}[1;1H", esc = 27 as char);
    wrap!(&columns);
    DirData::from(env::current_dir().unwrap()).pretty_print(&columns);
    wrap!(&columns);
}
