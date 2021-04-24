defmodule Efinancas.Companies.Create do
  alias Ecto.Multi
  alias Efinancas.{Company, User, Repo}

  def call(params) do
    Multi.new()
    |> Multi.insert(:create_company, Company.changeset(params))
    |> Multi.run(:create_user, fn repo, %{create_company: company} -> insert_user(repo, company.id, params["user"]) end)
    |> Multi.run(:preload_data, fn repo, %{create_company: company} -> preload_data(repo, company) end)
    |> run_transaction()
  end

  defp insert_user(repo, company_id, user) do
    user_params = build_params(company_id, user)
    user_params
    |> User.changeset()
    |> repo.insert()
  end

  defp preload_data(repo, company) do
    {:ok, repo.preload(company, :user)}
  end

  def run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{preload_data: company}} -> {:ok, company}
    end
  end

  defp build_params(id, user), do: %{"company_id" => id, "name" => user["name"], "email" => user["email"], "password" => user["password"]}
end
