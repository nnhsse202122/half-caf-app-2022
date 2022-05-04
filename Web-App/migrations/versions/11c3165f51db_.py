"""empty message

Revision ID: 11c3165f51db
Revises: 5bc9098b65ad
Create Date: 2022-05-02 19:45:45.476114

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '11c3165f51db'
down_revision = '5bc9098b65ad'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('order', sa.Column('read', sa.DateTime(), nullable=True))
    op.create_index(op.f('ix_order_read'), 'order', ['read'], unique=False)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_index(op.f('ix_order_read'), table_name='order')
    op.drop_column('order', 'read')
    # ### end Alembic commands ###
