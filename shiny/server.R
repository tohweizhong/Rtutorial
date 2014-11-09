require(shiny)

shinyServer(function(input,output){
  Data<-reactive({
    
    datFile<-input$datFile
    path<-as.character(datFile$datapath)
    
    df<-read.csv(path,
                 header=input$datHeader,
                 sep=input$datSep,
                 quote=input$datQuote,
                 stringsAsFactors=F)
    
    str(df)
    return(df)
  })
  
  output$dataPreview<-renderTable({
    if (is.null(Data())) return(NULL)
    data.frame(Data()[1:input$previewRows,])
  },digits=3)
})