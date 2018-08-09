% project an n-dim vector y to the simplex Dn
% Dn = { x : x n-dim, 1 >= x >= 0, sum(x) = 1}

% (c) Xiaojing Ye
% xyex19@gmail.com
%
% Algorithm is explained as in the linked document
% http://arxiv.org/abs/1101.6081
% or
% http://ufdc.ufl.edu/IR00000353/
%
% Jan. 14, 2011.
% https://github.com/aalto-ics-kepaco/MKC/blob/master/ProjSimplex.m

function y=projsmplx(y)
	b=sort(y);
	n=length(y);
	t=zeros(n,1);
	tmp=b(n);
	for i=n-1:-1:0
		if i==0
			that=(sum(b)-1)/n;
			break;
		end
		t(i)=(tmp-1)/(n-i);
		tmp=tmp+b(i);
		if (t(i)>=b(i))
			that=t(i);
			break;
		end
	end
	y=max(y-that,0);
end
