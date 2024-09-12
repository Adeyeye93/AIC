import React from "react";
import { Toaster, toast } from "sonner";

function ToasterComponent() {
  return (
    <Toaster position="bottom-right" expand={false} richColors />
  )
}

export default ToasterComponent;
