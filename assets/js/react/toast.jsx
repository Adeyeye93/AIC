import React from "react";
import { Toaster, toast } from "sonner";

function ToasterComponent() {
  return (
    <Toaster position="bottom-right" expand={true} richColors />
  )
}

export default ToasterComponent;
