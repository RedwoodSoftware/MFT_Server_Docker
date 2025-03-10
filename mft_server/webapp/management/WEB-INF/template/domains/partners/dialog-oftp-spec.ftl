<@form.dialog id="d-partner-oftp-spec" title=i18n.text("TradingPartners.SpecDialog.title")>
    <fieldset name="oftptradingpartnerspecfields" class="large">
        <@form.fields_title title=i18n.text("TradingPartners.SpecDialog.info.short") description=i18n.text("TradingPartners.SpecDialog.info.long")/>

        <div><@form.input name="issuer" description=i18n.text("TradingPartners.SpecDialog.label.issuer.description") example=i18n.text("TradingPartners.SpecDialog.label.issuer.example")><@i18n.message key="TradingPartners.SpecDialog.label.issuer" /></@></div>
        <div><@form.input name="subject" description=i18n.text("TradingPartners.SpecDialog.label.subject.description") example=i18n.text("TradingPartners.SpecDialog.label.subject.example")><@i18n.message key="TradingPartners.SpecDialog.label.subject" /></@></div>
        <div><@form.select name="keyusage" items={
            'DIGITAL_SIGNATURE': i18n.text("TradingPartners.keyUsage.DIGITAL_SIGNATURE"),
            'NON_REPUDIATION': i18n.text("TradingPartners.keyUsage.NON_REPUDIATION"),
            'KEY_ENCIPHERMENT': i18n.text("TradingPartners.keyUsage.KEY_ENCIPHERMENT"),
            'DATA_ENCIPHERMENT': i18n.text("TradingPartners.keyUsage.DATA_ENCIPHERMENT"),
            'KEY_AGREEMENT': i18n.text("TradingPartners.keyUsage.KEY_AGREEMENT"),
            'KEY_CERT_SIGN': i18n.text("TradingPartners.keyUsage.KEY_CERT_SIGN"),
            'CRL_SIGN': i18n.text("TradingPartners.keyUsage.CRL_SIGN"),
            'ENCIPHER_ONLY': i18n.text("TradingPartners.keyUsage.ENCIPHER_ONLY"),
            'DECIPHER_ONLY': i18n.text("TradingPartners.keyUsage.DECIPHER_ONLY")
        } description=i18n.text("TradingPartners.SpecDialog.label.keyUsage.description") example=i18n.text("TradingPartners.SpecDialog.label.keyUsage.example")><@i18n.message key="TradingPartners.SpecDialog.label.keyUsage" /></@></div>
        <div><@form.select name="extendedkeyusage" items={
            'ANY': i18n.text("TradingPartners.extendedKeyUsage.ANY"),
            'SERVER_AUTH': i18n.text("TradingPartners.extendedKeyUsage.SERVER_AUTH"),
            'CLIENT_AUTH': i18n.text("TradingPartners.extendedKeyUsage.CLIENT_AUTH"),
            'CODE_SIGNING': i18n.text("TradingPartners.extendedKeyUsage.CODE_SIGNING"),
            'EMAIL_PROTECTION': i18n.text("TradingPartners.extendedKeyUsage.EMAIL_PROTECTION"),
            'IPSEC_END_SYSTEM': i18n.text("TradingPartners.extendedKeyUsage.IPSEC_END_SYSTEM"),
            'IPSEC_TUNNEL': i18n.text("TradingPartners.extendedKeyUsage.IPSEC_TUNNEL"),
            'IPSEC_USER': i18n.text("TradingPartners.extendedKeyUsage.IPSEC_USER"),
            'TIMESTAMPING': i18n.text("TradingPartners.extendedKeyUsage.TIMESTAMPING"),
            'OCSP_SIGNING': i18n.text("TradingPartners.extendedKeyUsage.OCSP_SIGNING"),
            'DVCS': i18n.text("TradingPartners.extendedKeyUsage.DVCS"),
            'SBGP_CERT_AA_SERVER_AUTH': i18n.text("TradingPartners.extendedKeyUsage.SBGP_CERT_AA_SERVER_AUTH"),
            'SCVP_RESPONDER': i18n.text("TradingPartners.extendedKeyUsage.SCVP_RESPONDER"),
            'EAP_OVER_PPP': i18n.text("TradingPartners.extendedKeyUsage.EAP_OVER_PPP"),
            'EAP_OVER_LAN': i18n.text("TradingPartners.extendedKeyUsage.EAP_OVER_LAN"),
            'SCVP_SERVER': i18n.text("TradingPartners.extendedKeyUsage.SCVP_SERVER"),
            'SCVP_CLIENT': i18n.text("TradingPartners.extendedKeyUsage.SCVP_CLIENT"),
            'IPSEC_IKE': i18n.text("TradingPartners.extendedKeyUsage.IPSEC_IKE"),
            'CAPWAP_AC': i18n.text("TradingPartners.extendedKeyUsage.CAPWAP_AC"),
            'CAPWAP_WTP': i18n.text("TradingPartners.extendedKeyUsage.CAPWAP_WTP"),
            'SMART_CARD_LOGON': i18n.text("TradingPartners.extendedKeyUsage.SMART_CARD_LOGON")
        } description=i18n.text("TradingPartners.SpecDialog.label.extendedKeyUsage.description") example=i18n.text("TradingPartners.SpecDialog.label.extendedKeyUsage.example")><@i18n.message key="TradingPartners.SpecDialog.label.extendedKeyUsage" /></@></div>
    </fieldset>
</@form.dialog>
