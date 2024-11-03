# PROMPT
# You are given a DNA sequence and a list of motifs (subsequences).
# Your task is to write a function in R that identifies the starting positions of each motif
# within the DNA sequence. The function should return a list where each element corresponds
# to a motif and contains the starting positions of that motif in the DNA sequence.

# CONSTRAINTS
# The DNA sequence and motifs will only contain the characters ‘A’, ‘T’, ‘G’, and ‘C’.
# The length of the DNA sequence will be between 1 and 10,000.
# The number of motifs will be between 1 and 100.
# The length of each motif will be between 1 and 100.
find_motifs <- function(dna_sequence, motifs) {
  # Check if DNA sequence is a string
  if (!is.character(dna_sequence) || length(dna_sequence) != 1) {
    stop("Error: DNA sequence must be a single string.")
  }

  # Check if DNA sequence is empty
  if (dna_sequence == "") {
    stop("Error: DNA sequence cannot be an empty string.")
  }

  # Check if DNA sequence contains only valid characters
  if (!all(strsplit(dna_sequence, "")[[1]] %in% c("A", "T", "G", "C"))) {
    stop("Error: DNA sequence contains invalid characters. Only 'A', 'T', 'G', and 'C' are allowed.")
  }

  # Check if DNA sequence length is greater than 10,000
  if (nchar(dna_sequence) > 10000) {
    warning("Warning: DNA sequence length is greater than 10,000.")
    return(NA)
  }

  # Check if motifs is a vector
  if (!is.vector(motifs)) {
    stop("Error: Motifs must be a vector.")
  }

  # Check if motifs vector contains only strings
  if (!all(sapply(motifs, is.character))) {
    stop("Error: All motifs must be strings.")
  }

  # Check if motifs contain only valid characters
  if (!all(sapply(motifs, function(m) all(strsplit(m, "")[[1]] %in% c("A", "T", "G", "C"))))) {
    stop("Error: Motifs contain invalid characters. Only 'A', 'T', 'G', and 'C' are allowed.")
  }

  # Check if any motif is empty
  if (any(nchar(motifs) == 0)) {
    warning("Warning: Motif sequence cannot be empty.")
    return(NA)
  }

  # Check if any motif length is greater than 100
  if (any(nchar(motifs) > 100)) {
    warning("Warning: Motif sequence length is greater than 100.")
    return(NA)
  }

  # Check if number of motifs is greater than 100
  if (length(motifs) > 100) {
    warning("Warning: Number of motifs is greater than 100.")
    return(NA)
  }

  # Check if DNA sequence is smaller than any of the motifs
  if (any(nchar(dna_sequence) < nchar(motifs))) {
    stop("Error: DNA sequence is smaller than one or more motifs.")
  }

  # Initialize result list
  result <- list()

  # Find motifs in the DNA sequence
  for (motif in motifs) {
    positions <- gregexpr(motif, dna_sequence)[[1]]
    positions <- positions[positions > 0]  # Remove -1 values
    result[[motif]] <- positions
  }

  return(result)
}

