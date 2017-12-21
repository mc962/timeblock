require 'rails_helper'

RSpec.describe EventsController, type: :controller do
    describe 'validates the presence of an authenticated cookie' do
        context 'valid cookie' do
            before(:each) do
                session[:authentication_code] = Figaro.env.session_auth_key
            end

            it 'renders the new action' do
                get :new
                expect(response).to have_http_status(:ok)
            end

            it 'redirects to the new page from the entry page'

            it 'creates a new event' do
              post :create, params: { event:
                                      { time: DateTime.now,
                                        location: "31 Priscilla Circle, Wellesley, MA 02481",
                                        title: "Super Awesome Fun Event",
                                        description: "It'll be really fun!", comments: "No comments, please"
                                      }
                                    }
                expect(response).to have_http_status(:redirect)
            end
        end

        context 'invalid cookie' do
            it 'fails to create a new event' do
                post :create, params: { event:
                                        { time: DateTime.now,
                                          location: "31 Priscilla Circle, Wellesley, MA 02481",
                                          title: "Super Awesome Fun Event",
                                          description: "It'll be really fun!", comments: "No comments, please"
                                        }
                                      }

                expect(response).to have_http_status(:forbidden)
            end
        end
    end

end
