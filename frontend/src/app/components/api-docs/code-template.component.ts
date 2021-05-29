import { Component, Input } from '@angular/core';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-code-template',
  templateUrl: './code-template.component.html',
  styleUrls: ['./code-template.component.scss']
})
export class CodeTemplateComponent {
  @Input() network: string;
  @Input() code: {
    codeSample: {
      esModule: string;
      commonJS: string;
      curl: string;
    },
    responseSample: string;
  };
  hostname = document.location.hostname;

  constructor(
  ) { }

  normalizeCodeHostname(code: string) {
    let codeText: string;
    if (this.network === 'bisq' || this.network === 'liquid'){
      codeText = code.replace('%{1}', this.network);
    }else{
      codeText = code.replace('%{1}', 'bitcoin');
    }
    return codeText;
  }

  wrapESmodule(code: string) {
    let codeText = this.normalizeCodeHostname(code);

    if (this.network && this.network !== 'mainnet') {
      codeText = codeText.replace('mempoolJS();', `mempoolJS({
    hostname: '${this.hostname}/${this.network}'
  });` );
    }

    return `import mempoolJS from "@mempool/mempool.js";

const init = async () => {
  ${codeText}
};
init();`;
  }

  wrapCommonJS(code: string) {
    let codeText = this.normalizeCodeHostname(code);

    if (this.network && this.network !== 'mainnet') {
      codeText = codeText.replace('mempoolJS();', `mempoolJS({
          hostname: '${this.hostname}/${this.network}'
        });` );
    }
    return `<!DOCTYPE html>
<html>
  <head>
    <script src="https://mempool.space/mempool.js"></script>
    <script>
      const init = async () => {
        ${codeText}
      };
      init();
    </script>
  </head>
  <body></body>
</html>`;
  }

}
