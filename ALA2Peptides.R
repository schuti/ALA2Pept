############################################################################
# ALA2Pept: A peptide generator for human alpha-lactalbumin                #
# By Pasinee On-yam	and Somchai Chutipongtanate                            #
############################################################################

# Input: Amino acid sequence of human alpha-lactalbumin
ALA <- "MRFFVPLFLVGILFPAILAKQFTKCELSQLLKDIDGYGGIALPELICTMFHTSGYDTQAIVENNESTEYGLFQISNKLWCKSSQVPQSRNICDISCDKFLDDDITDDIMCAKKILDIKGIDYWLAHKALCTEKLEQWLCEKL"

# Generate peptides with 5-25 amino acids
input <- seq(5, 25, 1)
pept <- list()

for(i in 1:length(input)){
x <- as.integer(nchar(ALA))-input[i]+1
temp <- c()
list <- 1:x
  for(j in list){
    print(substring(ALA, j, j+input[i]-1))
    substring <- substring(ALA, j, j+input[i]-1)
    temp <- append(temp, substring)
    }
pept[[i]] <- data.frame(peptide = temp)
}

# Output: the comma separated vector (csv) file
peptide <- do.call(rbind, pept)
ALA2pept <- data.frame(No. = seq(1, nrow(peptides), 1), peptide)
write.csv(ALA2pept, file="ALA2pept.csv", row.names = F)

# End