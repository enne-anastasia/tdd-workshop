## This script loads the functions contained in the functions folder.
## Source it from within the same working directory.

# Function files
files <- list.files("./functions", pattern = "\\.R$", full.names = TRUE, recursive = TRUE)

# Load all the functions
for (f in files) source(f)
