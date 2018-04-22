% function [X,P]=Kalman_Filter(X,Y,A,B,C,Q,R,P,u)
% This function is Kalman_Filter
% Inputs:
%           X:       Matrix  
%           Y:       Matrix        
%           A:       Matrix        
%           B:       Matrix 
%           V:       Matrix 
%           Q:       Matrix 
%           R:       Matrix 
%           P:       Matrix 
%           u:       Matrix 
% Outputs:
%           X:       Matrix 
%           P:       Matrix 
function [X,P]=Kalman_Filter(X,Y,A,B,C,Q,R,P,u)
    % Prediction

    X=A*X+B*u;
    P=A*P*A'+R;

    %Kalman gain
    K=P*C'*inv(C*P*C'+Q);
    % Measurement update
    X=X+K*(Y-C*X);
    P=P-K*C*P;
end