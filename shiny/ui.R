shinyUI(pageWithSidebar(
  
  titlePanel("My app"),
  
  #sidebar panel
  sidebarPanel(
    
    tags$hr(),
    
    #data input
    fileInput('datFile',
              tags$h5(tags$strong('Choose .csv or .txt file to upload local file')),
              accept=c('text/csv', 'text/comma-separated-values,text/plain')),
    
    tags$hr(),
    
    #checkbox to indicate header == true or false
    checkboxInput('datHeader','Header contains attribute names', TRUE),
    
    tags$hr(),
    
    #file type
    radioButtons('datSep',
                 tags$h5(tags$strong("Separator")),
                 c("Comma(.csv)"=',',
                   "Tab(.txt/.tsv)"='\t'),
                 ','),
    
    tags$hr(),
    
    #quotation used in data file
    radioButtons('datQuote',
                 tags$h5(tags$strong('Quotes used in data file')),
                 c(None='',
                   'Double Quotes'='"',
                   'Single Quotes'="'"),
                 '"'),
    
    tags$hr(),
    
    #transpose data
    checkboxInput('datTranspose','Transpose data?',FALSE),
    width=3), #end sidebar panel
  
  mainPanel(
    tags$h4("Displaying a preview of your data"),
    sliderInput("previewRows","Number of rows to display",
                min=1,max=20,value=10,step=1,animate=TRUE),
    tableOutput("dataPreview"))
))