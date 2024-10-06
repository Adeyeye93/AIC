import React, { useState, useEffect } from 'react';
import { InputOtp } from 'primereact/inputotp';
import { Button } from 'primereact/button';

export default function SampleDemo() {
    const [token, setTokens] = useState('');
    const [isSubmitDisabled, setIsSubmitDisabled] = useState(true);
    const [resendTimer, setResendTimer] = useState(60); // Timer starts from 60 seconds
    const [canResend, setCanResend] = useState(false);

    const customInput = ({ events, props }) => {
        return (
            <>
                <input {...events} {...props} type="text" className="custom-otp-input-sample" />
                {props.id === 1 && (
                    <div className="mx-3 flex h-full items-center justify-center">
                        <svg xmlns="http://www.w3.org/2000/svg" height="10px" viewBox="0 -960 960 960" width="50px" fill="#FFFFFF">
                            <path d="M240-120v-66.67h480.67V-120H240Z" />
                        </svg>
                    </div>
                )}
            </>
        );
    };

    useEffect(() => {
        let timer;
        if (!canResend && resendTimer > 0) {
            timer = setInterval(() => {
                setResendTimer((prev) => prev - 1);
            }, 1000);
        } else if (resendTimer === 0) {
            setCanResend(true);
            clearInterval(timer);
        }

        return () => clearInterval(timer);
    }, [resendTimer, canResend]);

    useEffect(() => {
        setIsSubmitDisabled(token.length !== 4); // Disable if OTP is not 4 digits
    }, [token]);

    const handleResend = (event) => {
        if (canResend) {
            event.preventDefault()
            setResendTimer(60); 
            setCanResend(false);
        }
    };
 const handleOtpChange = (e) => {
    const combinedCode = typeof e.value === 'string' ? e.value : e.value.join(''); 
    document.getElementById('combined-otp-code').value = combinedCode;
};

    return (
        <div className="card flex justify-center">
            <style scoped>
                {`
                    .custom-otp-input-sample {
                        width: 48px;
                        height: 48px;
                        font-size: 24px;
                        appearance: none;
                        text-align: center;
                        transition: all 0.2s;
                        border-radius: 0;
                        border: 1px solid var(--surface-400);
                        background: transparent;
                        outline-offset: -2px;
                        outline-color: transparent;
                        transition: outline-color 0.3s;
                        color: var(--text-color);
                    }

                    .custom-otp-input-sample:focus {
                        outline: 2px solid var(--primary-color);
                    }

                    .custom-otp-input-sample:first-child {
                        border-top-left-radius: 12px;
                        border-bottom-left-radius: 12px;
                        border-left-width: 1px;
                        border-left-style: solid;
                        border-color: var(--surface-400);
                    }

                    .custom-otp-input-sample:last-child {
                        border-top-right-radius: 12px;
                        border-bottom-right-radius: 12px;
                        border-right-width: 1px;
                        border-right-style: solid;
                        border-color: var(--surface-400);
                    }
                `}
            </style>
            <div className="flex flex-col items-center justify-between h-64 w-full">
                <p className="font-bold poppins-extrabold text-gray-100 text-xl mb-2">Verify Your Account</p>
                <p className="text-gray-100 poppins-regular block mb-5">Please enter the code sent to your email.</p>
                <InputOtp value={token} onChange={(e) => {setTokens(e.value); handleOtpChange(e);}} length={4} inputTemplate={customInput} style={{ gap: 0 }} />
                <input type="hidden" name="code" id="combined-otp-code" />

                <div className="flex w-80 justify-between items-center mt-5">
                    {/* Resend Button or Timer */}
                    {canResend ? (
                                <Button
            label={canResend ? "Resend Code" : `Resend in ${resendTimer}`}
            phx-click="Resend"
            text
            className={`p-0 ${canResend ? 'bg-blue-500 text-white' : 'bg-gray-400 text-gray-600 cursor-not-allowed'}`}
            onClick={handleResend}
            disabled={!canResend}
                                />

                    ) : (
                        <p className="text-gray-200 poppins-light" >Resend in {resendTimer}</p>
                    )}

                    {/* Submit Button, disabled until OTP is entered */}
                    <Button id="submit" label="Submit Code" disabled={isSubmitDisabled} />
                </div>
            </div>
        </div>
    );
}
