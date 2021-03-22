
cobolR <- function(cobolCode) {

    program_id <- gsub('.+PROGRAM-ID\\. ([^.]+)\\..+','\\1',cobolCode)

    tmp_file        <- tempfile()
    cobol_file      <- paste0(tmp_file,'.cob')
    compile_output  <- paste0(tmp_file,'.so')

    writeLines(trimws(cobolCode),cobol_file)
    
    # Compile assuming free format
    system(paste0('cobc -free -fimplicit-init ',cobol_file,' -o ',compile_output ))
    # Load 
    dyn.load(compile_output)

    return(
        function(...) {
            .C(program_id,...)
        }
    )

}

