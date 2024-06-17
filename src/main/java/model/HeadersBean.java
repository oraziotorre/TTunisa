package model;

import java.util.List;

public class HeadersBean {

    private List<String> headerNames;
    private List<String> headerValues;

    public HeadersBean() {
        // Costruttore senza argomenti richiesto per JavaBean
    }

    // Getter per headerNames
    public List<String> getHeaderNames() {
        return headerNames;
    }

    // Setter per headerNames
    public void setHeaderNames(List<String> headerNames) {
        this.headerNames = headerNames;
    }

    // Getter per headerValues
    public List<String> getHeaderValues() {
        return headerValues;
    }

    // Setter per headerValues
    public void setHeaderValues(List<String> headerValues) {
        this.headerValues = headerValues;
    }
}





