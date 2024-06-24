A = [1,2,3] + 2;
B = transpose(A)*2;
%Fehler Dim A*x=B => geht nicht
%C = A/B;

D = [2 4; 6 8 ];
E = transpose(D)*2;
%gls lösen D*?=E
F = D/E;
D1 = F*E;

%für jede Spalte
[a,id_a] = min(D1);
[b, id_b] = max(D1);