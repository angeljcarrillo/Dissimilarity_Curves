function omega = dissimilarityMeasureF(U,Z,alfa)
UZ=dissimilarityMeasure(U,Z,alpha);
ZU=dissimilarityMeasure(Z,U,alpha);
omega=min(UZ,ZU);