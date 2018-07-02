extern crate reqwest;
extern crate select;
extern crate regex;

use select::document::{Document};
use select::predicate::{Attr, Class, Name};

const URL: &'static str = "https://projecteuler.net/problem=12";

fn main() {
    let body = reqwest::get(URL).unwrap().text().unwrap();

    let document = Document::from_read(body.as_bytes()).unwrap();
    let content = document.find(Attr("id", "content")).next().unwrap();
    let title = content.find(Name("h2")).next().unwrap().text();
    let problem_content = content.find(Class("problem_content")).next().unwrap().inner_html();

    let mut result = problem_content.replace("<br/>", "\n")
                                    .replace("<br>", "\n")
                                    .replace("</p>", "\n")
                                    .replace("<p>", "")
                                    .replace("<b>", "**")
                                    .replace("</b>", "**")
                                    .replace("</blockquote>", "")
                                    .replace("&nbsp;", "");

    let p_regex = regex::Regex::new(r"<p[^>]*>").unwrap();
    result = p_regex.replace_all(&result, "").to_string();

    let p_regex = regex::Regex::new(r"<blockquote[^>]*>").unwrap();
    result = p_regex.replace_all(&result, "").to_string();

    println!("{}", result);
}
