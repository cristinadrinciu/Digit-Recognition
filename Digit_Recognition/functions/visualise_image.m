function im = visualise_image (train_mat, number)
  % initializare matrice finala.
  im = zeros (28, 28);
  
  % citeste din matricea de antrenament linia cu numarul number.
  line = train_mat(number, :);
  
  % transforma linia citita intr-o matrice 28x28 care trebuie apoi
  % functia reshape
  im = reshape(line, 28, 28);
  
  % transpusa
  im = im';
  
  % transforma matricea in uint8 pentru a fi o imagine valida.
  im = uint8(im);
  imshow (im)
endfunction
