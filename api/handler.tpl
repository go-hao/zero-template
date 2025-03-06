package {{.PkgName}}

import (
	"net/http"

	{{if .HasRequest}}"github.com/zeromicro/go-zero/rest/httpx"{{end}}
    "github.com/go-hao/zero/xhttp"
    "github.com/go-hao/zero/xvalidator"
	{{.ImportPackages}}
)

{{if .HasDoc}}{{.Doc}}{{end}}
func {{.HandlerName}}(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		{{if .HasRequest}}var req types.{{.RequestType}}
		if err := httpx.Parse(r, &req); err != nil {
            xhttp.Json(r.Context(), w, err)
			return
		}

		if err := xvalidator.Validate(r.Context(), &req); err != nil {
			xhttp.Json(r.Context(), w, err)
			return
		} 

		{{end}}l := {{.LogicName}}.New{{.LogicType}}(r.Context(), svcCtx)
		{{if .HasResp}}resp, {{end}}err := l.{{.Call}}({{if .HasRequest}}&req{{end}})
		if err != nil {
            xhttp.Json(r.Context(), w, err)
		} else {
			xhttp.Json(r.Context(), w, {{if .HasResp}}resp{{else}}nil{{end}})
        }
	}
}
