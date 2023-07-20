function new_X = task3 (photo, pcs)
  [m, n] = size (photo);
  
  % initializare matrice finala.
  new_X = zeros (m, n);
  
  % cast photo la double.
  photo = double(photo);
  
  % calculeaza media fiecarui rand al matricii.
  miu = zeros(m, 1);
  for i = 1:m
    miu(i, 1) = sum(photo(i, :))/n;
  endfor
  
  % normalizeaza matricea initiala scazand din ea media fiecarui rand.
  for i = 1:m
    photo(i, :) -= miu(i,1);
  endfor
  
  % calculeaza matricea de covarianta.
  Z = photo * photo' / (n - 1);
  
  % calculeaza vectorii si valorile proprii ale matricei de covarianta.
  [V, S] = eig(Z);
  
  % ordoneaza descrescator valorile proprii si creaza o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.
  eigenvalues = diag(S); % pune val prorpii intr-un vector
  [sort_eigval, index] = sort(eigenvalues, 'descend');
  
  % se retin astfel si indicii de la coloane
  sort_eigval = V(:, index);
  
  % pastreaza doar primele pcs coloane
  % primele coloane din V reprezinta componentele principale si
  % pastrandu-le doar pe cele mai importante obtinem astfel o compresie buna
  % a datelor. Cu cat crestem numarul de componente principale claritatea
  % imaginii creste, dar de la un numar incolo diferenta nu poate fi sesizata
  % de ochiul uman asa ca pot fi eliminate.
  W = sort_eigval(:, 1:pcs);
  
  % creaza matricea Y schimband baza matricii initiale.
  Y = W' * photo;
  
  % calculeaza matricea new_X care este o aproximatie a matricii initiale
  new_X =  W * Y;
  
  % aduna media randurilor scazuta anterior.
  new_X += miu;
  
  % transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(new_X);
endfunction
