function [train_mat, train_val] = prepare_data (name, no_train_images)
  n = 784;

  % initializare train_mat.
  train_mat = zeros (no_train_images, n);
  
  % initializare train_val.
  train_val = zeros (no_train_images, 1);
  
  % incarca datele din tabelul primit ca argument.
  % functia load
  d = load(name);
  X = d.trainX;
  y = d.trainY;
  
  % salveaza in matricea train_mat primele no_train_images linii din
  % tabelul de imagini de antrenament.
  train_mat = X(1:no_train_images, :);
  
  % salveaza in vectorul train_val primele no_train_images valori ale
  % vectorului de etichete.
  train_val = y(1:no_train_images);
  train_val = train_val';
endfunction
