function[f]=Lagrangeinterps3D(x,y,z,w,xval,yval,zval)

%%
%==============================================================================
% Copyright (c) 2016 Universit� de Lorraine & Lule� tekniska universitet
% Author: Luca Di Stasio <luca.distasio@gmail.com>
%                        <luca.distasio@ingpec.eu>
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
% 
% 
% Redistributions of source code must retain the above copyright
% notice, this list of conditions and the following disclaimer.
% Redistributions in binary form must reproduce the above copyright
% notice, this list of conditions and the following disclaimer in
% the documentation and/or other materials provided with the distribution
% Neither the name of the Universit� de Lorraine or Lule� tekniska universitet
% nor the names of its contributors may be used to endorse or promote products
% derived from this software without specific prior written permission.
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.
%==============================================================================
%
%  DESCRIPTION
%  
%  A function to perform 
%
%  Input: N x 1 vector x of interpolation nodes
%         M x 1 vector y of interpolation nodes
%         L x 1 vector z of interpolation nodes
%         L x M x N vector w of values at interpolation nodes
%         P x 1 vector xval of nodes for function evaluation
%         R x 1 vector yval of nodes for function evaluation
%         Q x 1 vector zval of nodes for function evaluation
%  Output: Q x R x P vector f of function evaluations
%
%%


N = size(x,1);
M = size(y,1);
L = size(z,1);
P = size(xval,1);
R = size(yval,1);
Q = size(zval,1);

f = zeros(Q,R,P);

for q=1:Q
    for r=1:R
        for p=1:P
            fprq = 0;
            for k=1:L
                for j=1:M
                    for i=1:N
                        fprq = fprq + w(k,j,i)*Lagrangeinterpolant(x,xval(p,1),i)*Lagrangeinterpolant(y,yval(r,1),j)*Lagrangeinterpolant(z,zval(q,1),k);
                    end
                end
            end
            f(q,r,p) = fprq;
        end
    end
end

return