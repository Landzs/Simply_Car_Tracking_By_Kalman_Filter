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