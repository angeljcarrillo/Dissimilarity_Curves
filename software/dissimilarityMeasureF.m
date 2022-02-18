function omega = dissimilarityMeasureF(U,Z,EPSILON)
UZ=dissimilarityMeasure(U,Z,EPSILON);
ZU=dissimilarityMeasure(Z,U,EPSILON);
omega=sum([UZ ZU])/2;