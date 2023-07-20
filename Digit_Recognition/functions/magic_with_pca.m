function [train, miu, Y, Vk] = magic_with_pca (train_mat, pcs)
  [m, n] = size (train_mat);
  
  % initializare train
  train = zeros (m, pcs);
  
  % initializare miu
  miu = zeros (1, n);
  
  % initializare Y
  Y = zeros (m, pcs);
  
  % initializare Vk
  Vk = zeros (n, pcs);
  
  % cast train_mat la double.
  train_mat = double(train_mat);
  
  % calculeaza media fiecarei coloane a matricii.
  miu = mean(train_mat);
 
  % scade media din matricea initiala.
  for i = 1:n
    train_mat(:, i) -= miu(1,i);
  endfor
  
  % calculeaza matricea de covarianta.
  Z = train_mat' * train_mat / (m - 1);
  
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
  
  % pastreaza doar primele pcs coloane din matricea obtinuta anterior.
  Vk = sort_eigval(:, 1:pcs);
  
  % creaza matricea Y schimband baza matricii initiale.
  Y = train_mat * Vk;
  
  % calculeaza matricea train care este o aproximatie a matricii initiale
  % folosindu-va de matricea Vk calculata anterior
  train = Y * Vk';
endfunction
