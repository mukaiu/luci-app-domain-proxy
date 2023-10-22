'use strict';
'require view';
'require fs';
'require form';

return view.extend({
  render: function (domain) {
    var m, s, o;
    m = new form.Map('domain-proxy', _('Domain Proxy'));

    s = m.section(form.TypedSection, 'proxy', _('Proxy config'));
    s.anonymous = true;
    o = s.option(form.Value, 'dns', _('Dns Server'));
    o.datatype = 'ipaddrport';
    o.placeholder = '127.0.0.1:5353';

    o = s.option(
      form.DynamicList,
      'domain',
      _('Domain'),
      _('List of domains to proxy')
    );
    o.optional = true;
    o.datatype = 'host';
    o.placeholder = 'www.google.com';

    return m.render();
  },
  handleSaveApply: function (ev, mode) {
    return this.handleSave(ev).then(function () {
      classes.ui.changes.apply(mode == '0');
    });
  },
});
