books <- read.csv("books.csv")
authors <- read.csv("authors.csv")


# THE WRITER

# books by Mia Morgan
w_filter1 <- which(books$author == "Mia Morgan")

# only 1 book from author that is the answer
w_req_book <- books$title[w_filter1]


# THE MUSICIAN

# find books published in 1613
m_filter1 <- which(books$year==1613)

# find book on music
m_filter2 <- which(books$topic[m_filter1]=="Music")

# from filter2 we find 2nd book in filter1 is answer
m_req_book <- books$title[m_filter1[2]]


# THE TRAVELER

# find books published in 1775
t_filter1 <- which(books$year==1775)

# from filter1 there is only one book by Lysandra Silverleaf that is the answer
t_author <- books$author[t_filter1]
t_req_book <- books$title[t_filter1]


# THE PAINTER

# find books on 1990 and 1992
p_filter1 <- which(books$year == 1990 | books$year == 1992)

# check topics of filtered books
topic <-books$topic[p_filter1]

# from filter1 there is only one book(index 1 in filter) on art with 268 pages,
# so that is the answer
p_req_book <- books$title[p_filter1[1]]


# THE SCIENTIST

# find topic in data science/physics etc
topics <- unique(books$topic)

# find books on science
s_filter1 <-which(books$topic == "Science" )

# find books with 'Quantum Mechanics' in title
filtered <- books$title[s_filter1]
s_req_book <- filtered[which(grepl("Quantum Mechanics", filtered))]
#book found


# THE TEACHER

# find books on education that were published in 1700s
th_filter1 <- which(books$topic == "Education" & (books$year >= 1700 & books$year < 1800))

# find authors from Zenthia
writers <-books$author[th_filter1]
zenthia <- authors$author[which(authors$hometown == "Zenthia")]

# as there are only 2 authors from Zenthia we can use ifelse()
# to find the correct author amog them
req_author <- ifelse(zenthia[1]%in% writers, zenthia[1], zenthia[2])

# find index of author
req_index = th_filter1[which(books$author[th_filter1]==req_author)]

# find required book
th_req_book = books$title[req_index]










