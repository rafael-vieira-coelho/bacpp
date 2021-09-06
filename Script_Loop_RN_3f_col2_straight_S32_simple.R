library(nnet)

treino <- list()

treino[[1]] <- read.table("~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/sigma70_straight_col_2/sigma70_straight_simple/Dados_entrada_RN/TREINO_1_curvatura_col_2_straight_simple")
treino[[2]] <- read.table("~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/sigma70_straight_col_2/sigma70_straight_simple/Dados_entrada_RN/TREINO_2_curvatura_col_2_straight_simple")
treino[[3]] <- read.table("~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/sigma70_straight_col_2/sigma70_straight_simple/Dados_entrada_RN/TREINO_3_curvatura_col_2_straight_simple")
treino[[4]] <- read.table("~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/sigma70_straight_col_2/sigma70_straight_simple/Dados_entrada_RN/TREINO_4_curvatura_col_2_straight_simple")
treino[[5]] <- read.table("~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/sigma70_straight_col_2/sigma70_straight_simple/Dados_entrada_RN/TREINO_5_curvatura_col_2_straight_simple")

teste<-list()

teste[[1]] <- read.table("~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/sigma70_straight_col_2/sigma70_straight_simple/Dados_entrada_RN/TESTE_1_curvatura_col_2_straight_simple")
teste[[2]] <- read.table("~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/sigma70_straight_col_2/sigma70_straight_simple/Dados_entrada_RN/TESTE_2_curvatura_col_2_straight_simple")
teste[[3]] <- read.table("~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/sigma70_straight_col_2/sigma70_straight_simple/Dados_entrada_RN/TESTE_3_curvatura_col_2_straight_simple")
teste[[4]] <- read.table("~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/sigma70_straight_col_2/sigma70_straight_simple/Dados_entrada_RN/TESTE_4_curvatura_col_2_straight_simple")
teste[[5]] <- read.table("~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/sigma70_straight_col_2/sigma70_straight_simple/Dados_entrada_RN/TESTE_5_curvatura_col_2_straight_simple")

Lst <- list()
r <- list()

# 8 Neuronios
for (oculto in 1:8) # 1 a 8 neuronios
{	
	Lst[[1]]  <- nnet(x=treino[[1]][,1:320],y=treino[[1]][,321],size=oculto,maxit=0,MaxNWts=100000)
	Lst[[2]]  <- nnet(x=treino[[2]][,1:320],y=treino[[2]][,321],size=oculto,maxit=0,MaxNWts=100000)
	Lst[[3]]  <- nnet(x=treino[[3]][,1:320],y=treino[[3]][,321],size=oculto,maxit=0,MaxNWts=100000)
	Lst[[4]]  <- nnet(x=treino[[4]][,1:320],y=treino[[4]][,321],size=oculto,maxit=0,MaxNWts=100000)
	Lst[[5]]  <- nnet(x=treino[[5]][,1:320],y=treino[[5]][,321],size=oculto,maxit=0,MaxNWts=100000)
	
  # 5 Redes
	for(i in 1:5)
	{
    rms <- c()
    # 35 epocas
		for (j in 1:35)
		{	
			iteracoes <- j * 5			
      rmsTreino <- c()      
			rmsTeste  <- c()
      # 5 Folds
			for (k in 1:5)
			{		
				r[[i]] <- nnet(x=treino[[i]][,1:320],y=treino[[i]][,321], Wts=Lst[[k]]$wts,size=oculto, maxit=iteracoes, MaxNWts=10000,linout=TRUE)
				##############ERRO TESTE######################  			
				erro1<- predict(r[[i]],teste[[i]][,1:320])-teste[[i]][,321]				
				write (x=erro1, file=(paste("~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/erro_teste/","rede",i,iteracoes,"hidden",oculto,"list",k,"Erroteste_sigma70.txt")),ncolumns=1)
				##############RAIZ TESTE######################  			
				#sum(erro1)
				#sum(erro1*erro1)
				#sum(erro1*erro1)/306
				raiztes1 <- sqrt(sum(erro1*erro1)/306)
				write(x=raiztes1, file=(paste("~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/RMS/","rede",i,iteracoes,"hidden",oculto,"RMSteste_sigma70.txt")), ncolumns=1,append=TRUE)
				##############ERRO TREINO#######################        
        errot1<- predict(r[[i]],treino[[i]][,1:320])-treino[[i]][,321]
        write (x=errot1, file=(paste("~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/erro_treino/","rede",i,iteracoes,"hidden",oculto,"list",k,"Errotreino_sigma70.txt")),ncolumns=1)
				##############RMS######################
        #sum(errot1)
				#sum(errot1*errot1)
				#sum(errot1*errot1)/1224
				raiz1tre <- sqrt(sum(errot1*errot1)/1224)        
				write(x=raiz1tre, file=(paste("~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/RMS/","rede",i,iteracoes,"hidden",oculto,"RMStreino_sigma70.txt")),ncolumns=1,append=TRUE)
				rmsTreino <- c(rmsTreino, raiz1tre)
				rmsTeste <- c(rmsTeste, raiztes1)
			}
		} 
	}
}
