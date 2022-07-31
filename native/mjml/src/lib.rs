use mrml;
use rustler::{Encoder, Env, NifResult, Term};

mod atoms {
    rustler::atoms! {
      ok,
      error
    }
}

#[rustler::nif]
pub fn to_html<'a>(env: Env<'a>, mjml: String) -> NifResult<Term<'a>> {
    return match mrml::parse(&mjml) {
        Ok(mjml_content) => {
            let options = mrml::prelude::render::Options::default();

            return match mjml_content.render(&options) {
                Ok(html) => Ok((atoms::ok(), html).encode(env)),
                Err(error) => Ok((atoms::error(), error.to_string()).encode(env)),
            };
        }
        Err(_) => Ok((atoms::error(), "Couldn't convert MJML template").encode(env)),
    };
}

rustler::init!("Elixir.RustlerMjml", [to_html]);
