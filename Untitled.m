function [A , B] = GenImpCurve
trainVec= zeros(1,200)
testVec = zeros(1,51)
distance = zeros(128,251)
RowCount = 51
ColCount = 200
gen = []
Dist= []
data = load('FPImageData.mat');
Count = 0
train_index =1;
for i=1:128
  j=0
  while (j <=251) 

    if ( Count == 8)
        Count=0;
        j = j + 2 ;
    end
    j = j + 1;
    Count = Count+1;
    if(j>251)
        break
    end
    x= data[i,j];
    trainVec(train_index) = x;
    train_index = train_index+1;
  end

end

A = reshape(trainVec,200,128)'

Count = 0
test_index =1;
for i=1:144
  j=5
  Count=0
  while (j <=251) 

    if ( Count == 8)
        Count=0;
        j = j + 2 ;
    end
    j = j + 1;
    Count = Count+1;
    if(j>251)
        break
    end
    x= data(i,j);
    testVec(test_index) = x;
    test_index = test_index+1;
  end

end

B = reshape(testVec,51,128)' 

if(strcmp(Dist,'Euclidean'))

        for i = 1:RowCountount
            for j = 1:CountolCountount
                distance(i,j) = sqrt(sum((A(:,j) - B(:,i)) .^ 2));

            end
        end
else 
    for i = 1:RowCount
        for j = 1:ColCount
            distance(i,j) = 1 - dot(A(:,j),B(:,i))/norm(A(:,j))/norm(B(:,i));
        end
    end
end
gen = [];
imp = [];
indexer = 1;
 for i = 1:RowCount
       
        for j = 1:500
            if(j < ((indexer*5)-4) || j > (indexer*5 ) ||  i < ((indexer*5)-4) || i > (indexer*5 ) ) 
                imp = [imp,distance(i,j)];
            else
                 gen = [gen,distance(i,j)];  
            end 
            
        end
        if(i-1 ~= 0)
            x = i-1;
           if(mod(x,5) == 0 )
                indexer = indexer + 1;
           end
       end
 end
% for plotting the graph
hold on
histogram(gen,'Normalization','pdf')
histogram(imp,'Normalization','pdf')
ylabel('Frequencies');
xlabel(' Scores');
legend('Gen','Imp')
 
end
