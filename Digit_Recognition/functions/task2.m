function new_X = task2 (photo, pcs)
  [m n] = size(photo);
  
  % initializare matrice finala.
  new_X = zeros(m, n);
  
  % cast photo la double.
  photo = double(photo);
  % normalizeaza matricea initiala scazand din ea media fiecarui rand.
  miu = zeros(m, 1);
  for i = 1:m
    miu(i, 1) = sum(photo(i, :))/n;
  endfor
  
  % actualizam matricea photo
  for i = 1:m
    photo(i, :) -= miu(i,1);
  endfor
  
  % construieste matricea Z.
  Z = photo' / sqrt(n - 1);
  
  % calculeaza matricile U, S si V din SVD aplicat matricii Z
  [U, S, V] = svd(Z);
  
  % construieste matricea W din primele pcs coloane ale lui V
  W = V(:, 1:pcs);
  
  % cacluleaza matricea Y
  Y = W' * photo;
  
  % aproximeaza matricea initiala
  new_X =  W * Y + miu;
  
  % transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(new_X);
endfunction
