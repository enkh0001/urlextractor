
library('keboola.r.docker.application')

# intialize application
app <- DockerApplication$new('/data/')
app$readConfig()


install.packages("rvest",repos = "http://cran.us.r-project.org")

library("rvest")

gg<-read_html("https://www.gadogado.cz/cs/produkty/?id_category=22&n=74")

img<-gg%>%html_nodes("img.img-responsive.img1") %>%html_attr("src")

product_id<-gg%>%html_nodes("a.Xquick-view") %>%html_attr("data-id-product")

gg<-data.frame(product_id,img)

write.csv(gg, file = "/data/out/tables/gg.csv", row.names = FALSE)
