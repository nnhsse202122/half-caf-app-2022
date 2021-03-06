"""empty message

Revision ID: 214010d4e25b
Revises: 089a948c7cf3
Create Date: 2020-02-25 20:53:18.247858

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '214010d4e25b'
down_revision = '089a948c7cf3'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('user', sa.Column('current_order_id', sa.Integer(), nullable=True))
    op.create_foreign_key(None, 'user', 'order', ['current_order_id'], ['id'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'user', type_='foreignkey')
    op.drop_column('user', 'current_order_id')
    # ### end Alembic commands ###
